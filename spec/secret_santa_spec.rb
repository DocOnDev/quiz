require "lib/secret_santa"

class TestSecretSanta
    describe Person do

        before(:each) do
            @person = Person.new('Michael Norton michael@docondev.com')
        end

        it "should be created from a single parameter" do
            @person
        end

        it "should be created from three parameters" do
            new_person = Person.new('First', 'Last', 'email')
        end

        it "should be possible santa for non-matching family name" do
            candidate = Person.new('John', 'Smith', 'jsmith@docondev.com')
            @person.should be_possible_santa_for(candidate)
        end

        it "should not be possible santa for matching family name" do
            candidate = Person.new('John', 'Norton', 'jnorton@docondev.com')
            @person.should_not be_possible_santa_for(candidate)
        end
    end

    describe SantaList do

        before(:each) do
            @people = []
            @people << Person.new('Michael Norton michael@docondev.com')
            @people << Person.new('Jennifer Norton jennifer@docondev.com')
            @people << Person.new('Michael Smith michael.smith@docondev.com')
            @people << Person.new('Michael Jones michael.jones@docondev.com')
            @people << Person.new('Randolph Smith randolph.smith@docondev.com')
            @people << Person.new('Michael James michael.james@docondev.com')
            @santa_list = SantaList.new(@people)
            @santa_list.make_assignments
        end

        it "should assign each person a santa" do
            @santa_list.people[0].santa.family.should_not be_empty
        end

        it "should not assign people in the same family" do
            @santa_list.people.each do |person| 
                person.family.should_not == person.santa.family
            end
        end

    end
end
