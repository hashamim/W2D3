require "rspec"
require "tdd"
#return array different from original array
#removes dups
#does not use unique

describe "#my_uniq" do
    it "Removes Duplicate Elements" do 
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end

    it "Returns a New Array" do
        input_arr = [1,2,1,3,3]
        unique = input_arr.my_uniq
        expect(unique).to be_an_instance_of(Array)
        expect(input_arr).to_not be(unique)
    end 
    it "Does Not Use Array#uniq" do
        test_arr = [1,2,1,3,3]
        expect(test_arr).to_not receive(:uniq)
        test_arr.my_uniq
    end
end


describe "#two_sum" do
    it 'Contains Correct Pairs' do
        expect([-1,0,2,-2,1].two_sum).to match_array([[0,4],[2,3]])
    end
    # it 'Returns Pairs in Correct Order' do
    #     expect([-1,0,2,-2,1].two_sum)
    # end

    it "Returns an Array" do
        expect([].two_sum).to be_an_instance_of(Array)
    end
    context "if there are no valid pairs" do
        it "returns an empty array" do
            expect([-1,2,3,4,5,6,7].two_sum).to eq([])
        end
    end
    
    it "Pairs contain different indices" do
        expect([-1, 0, 2, -2, 1].two_sum).to_not include([1,1])
    end
end

#expect reutrn value to match array => contains correct values
#return_value = return_value.sort => order is correct
#[-1, 0, 2, -2, 1] => [[0,4]] 

describe "#my_transpose" do

    it 'Should return a matrix with the same number of rows and columns' do
        # expect([[]].my_transpose).to eq([[]])
        expect([[1,1],[1,1]].my_transpose).to eq([[1,1],[1,1]])
    end

    it 'Transposes the matrix' do
        expect([[1,2],[3,4]].my_transpose).to eq([[1,3],[2,4]])
    end
    context "when a non-square matrix is received" do
         it "Raise an exception" do
            expect{[[1,2]].my_transpose}.to raise_error "Not A Square Matrix!"
        end
    end

end

describe "stock_pickr" do
    it "should return an array" do
        expect(stock_pickr([1,0])).to be_an_instance_of(Array)
    end

    it "Stock should be sold after it was purchased" do
        ret = stock_pickr([1,0,-1,-3,-7,])
        expect(ret[1]).to be > ret[0]
    end

    it "Should only return two days" do
        expect(stock_pickr([1,2]).length).to eq(2)
    end
    
    context "if the value decreases every day" do
        it "returns the smallest loss" do
            expect(stock_pickr([2,1,-1,-6])).to eq([0,1])
        end
    end
end

describe "Towers of Hanoi" do
    subject (:game) {Towers.new}
    describe "#move" do
        it "should not change the total number of discs" do
            discs = game.piles.flatten
            game.move(0, 1)
            expect(game.piles.flatten.count).to eq discs.count
        end

        context "if the user attempts to enter invalid move" do 
            it "should raise an error" do
            game.piles = [[1], [3,2], [4]]
            expect{game.move(2, 0)}.to raise_error
            end
            
            it "should raise an error if user attempts to move disc from empty pile" do
                game.piles = [[1],[4,3,2],[]]
                expect{game.move(2, 0)}.to raise_error 
            end

            it "should raise an error if user attempts to move disc between non-existent piles" do
                expect{game.move(3, 1)}.to raise_error
                expect{game.move(1, 3)}.to raise_error
            end

        end

    end
    describe "#won?" do
        it "should return a boolean" do
            expect(!!game.won?).to eq(game.won?)
        end
        it "should return false if the game is not won" do
            game.piles = [[4],[],[3,2,1]]
        end
        context "if the user wins" do
            
            it "should not allow the user to do any other moves" do
                game.piles = [[],[],[4,3,2,1]]
                expect{game.move(2,0)}.to raise_error
            end
            it "should return true" do
                game.piles = [[],[],[4,3,2,1]]
                expect(game.won?).to be(true)
            end
        end
    end
end

