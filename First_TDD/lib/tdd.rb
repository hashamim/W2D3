class Array
    def my_uniq
        self.uniq
    end

    def two_sum
        pairs = []

        (0...self.length).each do |idx_1|
            (idx_1 + 1...self.length).each do |idx_2|
                pairs << [idx_1, idx_2] if self[idx_1] + self[idx_2] == 0
            end
        end

        pairs
    end
    
    def my_transpose
        raise 'Not A Square Matrix!' if self.any? { |row| row.length != self.length }
        ret_matrix = []
        (0...self.length).each do |idx1|
            row = []
            (0...self.length).each do |idx2|
                row << self[idx2][idx1]
            end
            ret_matrix << row
        end

        ret_matrix
    end

end

def stock_pickr(arr)
    
    # days = []
    max = arr[1] - arr[0]
    max_day = [0, 1]

    (0...arr.length).each do |idx_1|
        (idx_1 + 1...arr.length).each do |idx_2|
            if arr[idx_2] - arr[idx_1] > max
                max = arr[idx_2] - arr[idx_1]
                max_day = [idx_1, idx_2]
            end
        end
    end

    max_day

end


class Towers

    attr_accessor :piles

    def initialize
        @piles = [[4, 3, 2, 1], [], []]
    end

    def move(start_pile, end_pile)
        raise if self.won?
        raise if self.piles[start_pile].empty?
        raise if !self.piles[end_pile].last.nil? &&  disc < self.piles[end_pile].last 
        disc = self.piles[start_pile].pop
        self.piles[end_pile] << disc
    end


    def won?
        @piles[0..1].all? { |pile| pile.empty?}
    end

end
