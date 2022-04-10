module CheckMatch
  def check_for_match(player_array)
    row_sums = sum_rows(player_array)
    column_sums = sum_columns(player_array)
    row_sums_four = row_totals_at_least_four(row_sums)
    column_sums_four = column_totals_at_least_four(column_sums)
    matching_row_pairs = collect_row_pairs(player_array, row_sums_four)
    matching_column_pairs = collect_column_pairs(player_array, column_sums_four)
    row_match = check_row_match(matching_row_pairs)
    column_match = check_column_match(matching_column_pairs) 
    row_match or column_match ? true : false
  end

  # sums the number of player pieces in each row
  def sum_rows(player_array)
    row_totals = Hash.new(0)
    player_array.each do |row_col|
      row_totals[row_col[0]] += 1
    end
    row_totals
  end

  # sums the number of player pieces in each column
  def sum_columns(player_array)
    column_totals = Hash.new(0)
    player_array.each do |row_col|
      column_totals[row_col[1]] += 1
    end
    column_totals
  end

  # filters row totals to only 4+ count
  def row_totals_at_least_four(row_totals)
    row_totals.select do |key, value|
      value >= 4
    end
  end

  # filters column totals to only 4+ count
  def column_totals_at_least_four(column_totals)
    column_totals.select do |key, value|
      value >= 4
    end
  end

  def collect_row_pairs(player_array, totals_at_least_four)
  match_array = []
    player_array.each do |row_col|
      if totals_at_least_four.keys.include? row_col[0]
      match_array.push(row_col)
      end
    end
    match_array
  end

  def collect_column_pairs(player_array, totals_at_least_four)
  match_array = []
    player_array.each do |row_col|
      if totals_at_least_four.keys.include? row_col[1]
      match_array.push(row_col)
      end
    end
    match_array
  end

  def check_row_match(matching_pairs)
    return false if matching_pairs.empty?
    matching_pairs.sort.each_cons(4) do |group|
      return group.each_cons(2).all? do |first_pair, second_pair| 
        second_pair[1] == first_pair[1] + 1
      end
    end
  end

  def check_column_match(matching_pairs)
    return false if matching_pairs.empty?
    matching_pairs.sort.each_cons(4) do |group|
      return group.each_cons(2).all? do |first_pair, second_pair| 
        second_pair[0] == first_pair[0] + 1
      end
    end
  end
end