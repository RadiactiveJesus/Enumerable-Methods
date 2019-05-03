module Enumerable
    def my_each
        for i in (0..self.length - 1) do
          yield(self[i])
        end 
    end
    def my_each_with_index
        for i in (0..self.length - 1) do
            yield(self[i], i)
        end
    end
    def my_select
        result_array = []
        self.my_each do |value|
          if yield(value)
            result_array.push(value)
          end
        end
        return result_array
    end
    def my_all?
        self.my_each do |value|
            if !yield(value)
              return false
            end
        end
    end
    def my_any?
        self.my_each do |value|
            if yield(value)
              return true
            end
        end
    end
    def my_none?
        self.my_each do |value|
            if yield(value)
              return false
            end
        end
    end
    def my_count
        count = 0
        self.my_each do |value|
        if yield(value)
          count += 1
        end
      end
    end
    def my_map(proc = '')
        result_array = []
        if proc.is_a? (Proc)
            self.my_each_with_index do |value, i|
            result_array[i] = proc.call(value)
            end
        else
            self.my_each_with_index do |value, i|
            result_array[i] = yield(value)
            end
        end
        return result_array
    end
    def my_inject(x)
        output = x
        self.my_each do |value|
            total = yield(total, value)
        end
        return output
    end
end
