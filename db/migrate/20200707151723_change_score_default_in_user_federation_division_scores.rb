class ChangeScoreDefaultInUserFederationDivisionScores < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:user_federation_division_scores, :score, 0)
  end
end
