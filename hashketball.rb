require 'pry'

def game_hash
    {:home => {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :number => 0,
                    :shoe =>  16, 
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1, 
                    :slam_dunks => 1},
                "Reggie Evans" => {
                    :number => 30,
                    :shoe => 14, 
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12, 
                    :slam_dunks => 7},
                "Brook Lopez" => {
                    :number => 11,
                    :shoe => 17, 
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1, 
                    :slam_dunks => 15},
                "Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19, 
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8, 
                    :slam_dunks => 5},
                "Jason Terry" => {
                    :number => 31,
                    :shoe => 15, 
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11, 
                    :slam_dunks => 1},
            }
            },
    :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18, 
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7, 
                    :slam_dunks => 2},
                "Bismack Biyombo"  => {
                    :number => 0,
                    :shoe => 16, 
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15, 
                    :slam_dunks => 10},
                "DeSagna Diop"  => {
                    :number => 2,
                    :shoe => 14, 
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5, 
                    :slam_dunks => 5},
                "Ben Gordon"  => {
                    :number => 8,
                    :shoe => 15, 
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1, 
                    :slam_dunks => 0},
                "Brendan Haywood"  => {
                    :number => 33,
                    :shoe => 15, 
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5, 
                    :slam_dunks => 12},
             }
        }
    }
end

def num_points_scored(player) #returns number of points
    game_hash.map do |location, team_data| 
        if team_data[:players].keys.include?(player)
            return team_data[:players][player][:points]
        end        
    end
end

def shoe_size(player) #returns the shoe size
    game_hash.map do |location, team_data|
        if team_data[:players].keys.include?(player)
            return team_data[:players][player][:shoe]    
        end
    end
end

def team_colors(team_name) #returns an array of that teams colors
    game_hash.map do |location, team_data|
        if team_data[:team_name] == team_name
            return team_data[:colors]
         end
    end
end

def team_names # return an array of the team names
    team_names = []
    game_hash.map do |location, team_data|
        team_names << team_data[:team_name]
    end
    return team_names
end

def player_numbers(team_name) #returns an array jersey numbers for that team
    jersey_numbers = []
    game_hash.map do |location, team_data|
        if team_data[:team_name] == team_name
            team_data[:players].map do |player, stats|
                jersey_numbers << stats[:number]
            end
        end        
    end
    return jersey_numbers
end

def player_stats(player) #returns a hash of that player's stats
    game_hash.map do |location, team_data|
        if team_data[:players].keys.include?(player)
            return team_data[:players][player]
        end
    end
end

def big_shoe_rebounds #return the number of rebounds of the player that has largest shoe size
    biggest_shoe = 0
    biggest_player = ""
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if stats[:shoe] > biggest_shoe
                biggest_shoe = stats[:shoe]
                biggest_player = player
            end
        end
    end
    game_hash.map do |location, team_data|
        if team_data[:players].keys.include?(biggest_player)
            return team_data[:players][biggest_player][:rebounds]
        end
    end
end

def most_points_scored #return player with most points scored
    biggest_score = 0
    biggest_player = ""
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if stats[:points] > biggest_score
                biggest_score = stats[:points]
               
               biggest_player = player
            end
        end
    end
    return biggest_player
end

def winning_team #return team with most points
    home_points = 0
    away_points = 0
    game_hash[:home][:players].map do |player, stats|
        home_points += stats[:points]        
    end
    game_hash[:away][:players].map do |player, stats|
        away_points += stats[:points]        
    end

    if home_points > away_points
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name_person = ""
    longest_name_length = 0
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if player.length >= longest_name_length
                longest_name_length = player.length
                longest_name_person = player
            end
        end
    end
    return longest_name_person
end

def long_name_steals_a_ton? #returns true if player with longest name had most steals
    longest_name = player_with_longest_name
    most_steals = 0
    most_steals_player = ""
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if stats[:steals] > most_steals
                most_steals = stats[:steals]
                most_steals_player = player
            end
        end
    end
    if longest_name == most_steals_player
        return true
    end
end

