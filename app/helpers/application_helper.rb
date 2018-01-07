SPORT_COLORS = {
  "Running" => "#ECAE4B",
  "Swimming" => "#4E95EA",
  "Cycling" => "#929873",
  "XCSkiing" => "#96CAC5",
  "Strength" => "#F04A5C",
  "Flexibility" => "#45C5AE"
}.freeze

SPORT_ICONS = {
  "Running" =>"🏃🏻‍",
  "Swimming" =>"🏊‍",
  "Cycling" =>"🚴‍",
  "XCSkiing" =>"⛷️",
  "Strength" =>"🏋️‍",
  "Flexibility" =>"🤸"
}.freeze

module ApplicationHelper
  def up_or_down(rank, prev_rank)
    if rank == prev_rank
      "<small class='supermuted'>-</small>"
    elsif rank > prev_rank
      "<span class='down'>&#8675;</span> <span class='muted'>#{rank-prev_rank}</span>"
    elsif rank < prev_rank
      "<span class='up'>&#8673;</span> <span class='muted'>#{prev_rank-rank}</span>"
    end
  end

  def avg(arr)
    return 0 unless arr.size > 0
    (arr.reduce(:+) / arr.size)
  end
end
