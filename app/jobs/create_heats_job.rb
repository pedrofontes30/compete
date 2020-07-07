class CreateHeatsJob < ApplicationJob
  queue_as :default

  def perform(competition_division)
    competition_division = CompetitionDivision.find(competition_division.id)
    if competition_division.competition.registration_deadline == Date.today
      competition_division.heats.destroy_all
      create_heats(competition_division.registrations, competition_division.id)
    end
  end

  def create_heats(registrations, id)
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
end
