require 'byebug'
class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        selected = []

        self.my_each do |el|
            selected << el if prc.call(el)
        end

        selected
    end

    def my_reject(&prc)
        rejected = []

        self.my_each do |el|
            rejected << el unless prc.call(el)
        end

        rejected
    end

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end

        false
    end

    def my_all?(&prc)
        self.my_each do |el|
            return false unless prc.call(el)
        end

        true
    end

    def my_flatten
        flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end
        end

        flattened
    end
end
