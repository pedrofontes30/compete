class CompetitionDivision < ApplicationRecord
  belongs_to :competition
  belongs_to :division
  has_many :registrations
  has_many :heats

  def select_label
    division.name
  end

  def create_heats
    heats.destroy_all
    if registrations.length <= 2
      round = ['final', 1]
    elsif registrations.length <= 4
      round = ['semi-finals', 2]
      Heat.create(competition_division_id: id, round: 'final')
    elsif registrations.length <= 8
      round = ['quarter-finals', 4]
      Heat.create(competition_division_id: id, round: 'final')
      2.times { Heat.create(competition_division_id: id, round: 'semi-finals') }
    elsif registrations.length <= 16
      round = ['round of 16', 8]
      Heat.create(competition_division_id: id, round: 'final')
      2.times { Heat.create(competition_division_id: id, round: 'semi-finals') }
      4.times { Heat.create(competition_division_id: id, round: 'quarter-finals') }
    elsif registrations.length <= 32
      round = ['round of 32', 16]
      Heat.create(competition_division_id: id, round: 'final')
      2.times { Heat.create(competition_division_id: id, round: 'semi-finals') }
      4.times { Heat.create(competition_division_id: id, round: 'quarter-finals') }
      8.times Heat.create(competition_division_id: id, round: 'round of 16')
    end

    registrations.in_groups(round[1]) do |group|
      heat = Heat.new(competition_division_id: id, round: round[0])
      update_heat(group.first.user, heat) if group.any? { |e| e.nil? }
      heat.save!
      group.each { |registration| HeatUser.create(heat: heat, user_id: registration.user_id) unless registration.nil? }
    end
  end

  def update_heat(user, heat)
    competition_division = heat.competition_division
    heat.heat_users.length > 1 ? loser = heat.heat_users.where.not(user_id: user.id).first.user : loser = nil
    l_fed_div_score = UserFederationDivisionScore.where(user: loser, federation: heat.competition_division.competition.federation, division: heat.competition_division.division).first unless loser.nil?
    w_fed_div_score = UserFederationDivisionScore.where(user: user, federation: heat.competition_division.competition.federation, division: heat.competition_division.division).first
    if heat.user.nil?
      heat.update(user: user)
      if heat.round == 'final'
        w_fed_div_score.score += 45
        w_fed_div_score.save
        update_loser_score(l_fed_div_score, 15) unless loser.nil?
      elsif heat.round == 'semi-finals'
        next_round_heat = Heat.where(competition_division: competition_division, round: 'final').first
        HeatUser.create(heat: next_round_heat, user_id: user.id)
        update_loser_score(l_fed_div_score, 5) unless loser.nil?
      elsif heat.round == 'quarter-finals'
        next_round_heats = Heat.where(competition_division: competition_division, round: 'semi-finals')
        next_round_heats.each do |upcoming_heat|
          if HeatUser.where(heat: upcoming_heat).length < 2
            HeatUser.create(heat: upcoming_heat, user_id: user.id)
            break
          end
        end
      elsif heat.round == 'round of 16'
        next_round_heats = Heat.where(competition_division: competition_division, round: 'quarter-finals')
        next_round_heats.each do |upcoming_heat|
          if HeatUser.where(heat: upcoming_heat).length < 2
            HeatUser.create(heat: upcoming_heat, user_id: user.id)
            break
          end
        end
      elsif heat.round == 'round of 32'
        next_round_heats = Heat.where(competition_division: competition_division, round: 'round of 16')
        next_round_heats.each do |upcoming_heat|
          if HeatUser.where(heat: upcoming_heat).length < 2
            HeatUser.create(heat: upcoming_heat, user_id: user.id)
            break
          end
        end
      end
    end
  end

  def update_loser_score(user_federation_division_score, points_to_add)
    user_federation_division_score.score += points_to_add
    user_federation_division_score.save
  end
end
