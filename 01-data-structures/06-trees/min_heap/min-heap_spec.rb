include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }
  let (:tree) { MinHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as the min child" do
      tree.insert(pacific_rim) 
      expect(tree[1].title).to eq "Pacific Rim"
    end
    it "properly inserts multiple values" do
      tree.insert(pacific_rim) 
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      expect(tree[0]).to eq nil
      expect(tree[1].title).to eq "Pacific Rim"
      expect(tree[2].title).to eq "Star Wars: Return of the Jedi"
      expect(tree[3].title).to eq "Braveheart"
      expect(tree[4].title).to eq "The Matrix"
      expect(tree[5].title).to eq "Donnie Darko"
      expect(tree[6].title).to eq "Inception"
      expect(tree[tree.length - 1].title).to eq "District 9"      
    end
  end

  describe "#find(data)" do
    it "properly gives the correct index" do
      tree.insert(pacific_rim) 
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      tree.find(pacific_rim.title)
      expect(tree.find(pacific_rim.title)).to eq 1
      tree.find(braveheart.title)
      expect(tree.find(braveheart.title)).to eq 3
      tree.find(inception.title)
      expect(tree.find(inception.title)).to eq 6
    end
  end

  describe "#delete(data)" do
    it "properly deletes minimum value" do 
      tree.insert(pacific_rim) 
      tree.delete()
      expect(tree[1].title).to eq "The Matrix"
    end
    it "properly deletes minimum value with multiple value tree" do 
      tree.insert(pacific_rim) 
      tree.insert(braveheart)
      tree.delete()
      expect(tree[1].title).to eq "Braveheart"
    end
    it "properly deletes minimum value with multiple delete calls" do 
      tree.insert(pacific_rim) 
      tree.insert(district)
      tree.delete()
      tree.delete()
      expect(tree[1].title).to eq "District 9"
    end
  end

  describe "#print(root)" do
    expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\n"
    it "prints out proper order of values of heap" do
      tree.insert(pacific_rim) 
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(district)
      expect(tree.print).to eq expected_output
    end
  end
end
