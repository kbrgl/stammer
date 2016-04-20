class Stammer
  attr_reader :lines
  @@need_more = /(if|def|class|do|begin|case|for|until|while)/
  def initialize(prompt='(%n)>>> ', prompt2: '(%n)... ')
    @prompt = prompt
    @prompt2 = prompt2
    @lines = 0
  end
  def next
    print @prompt.gsub('%n', "#{@lines + 1}")
    input = gets
    if input =~ @@need_more then
      until input =~ /#{@@need_more}.*end/m
        print @prompt2.gsub('%n', "#{@lines + 1}")
        input += gets
      end
    end
    @lines += 1
    input
  end
end
