class Person

    attr_reader :first, :family, :mail
    attr_accessor :santa
    def initialize(first, family = nil, mail = nil)
        @first, @family, @mail = first, family, mail
        @first, @family, @mail = first.split(" ") unless @family
    end

    def possible_santa_for?(candidate)
        @family != candidate.family
    end
end

class SantaList
    attr_reader :people, :santas
    def initialize(people)
        @people = people
        @santas = @people.dup
    end

    def make_assignments
        make_random_assignments
        adjust_assignments
    end
    
    def make_random_assignments
        @people.each do |person|
            person.santa = @santas.delete_at(rand(@santas.size))
        end
    end

    def adjust_assignments
        @people.each do |person|
            unless person.santa.possible_santa_for? person
                possible_santas = get_possible_santas_for(person)
                raise if possible_santas.empty?
                swap_random_santa(person, possible_santas)
            end
        end
    end

    def get_possible_santas_for(person)
        @people.select { |individual|
            individual.santa.possible_santa_for?(person) &&
            person.santa.possible_santa_for?(individual)
        }
    end

    def swap_random_santa(person, possible_santas)
        new_candidate = possible_santas[rand(possible_santas.size)]
        current_santa = person.santa
        person.santa = new_candidate.santa
        new_candidate.santa = current_santa
    end
end
