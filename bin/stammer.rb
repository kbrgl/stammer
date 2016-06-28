#!/usr/bin/env ruby

require 'colorize'

VERSION = 0.1

puts "Stammer #{VERSION} running on Ruby #{RUBY_VERSION}"

line = 0

prompt = "(%n)> "

def L!(path)
    if path.class == Symbol
        load "./#{path.to_s}.rb"
    else
        load path
    end
end

loop {
    begin
        line += 1
        print prompt.gsub("%n", line.to_s)
        input = gets
        if input.nil?
            exit 0
        end

        begin
            puts "=> #{eval(input).inspect}".green
        rescue SyntaxError => e
            puts e.backtrace.join("\n\t")
                  .sub("\n\t", ": #{e}#{e.class ? " (#{e.class})" : ''}\n\t").red
        rescue Exception => e
            puts e.backtrace.join("\n\t")
                  .sub("\n\t", ": #{e}#{e.class ? " (#{e.class})" : ''}\n\t").red
        end
    rescue Interrupt
        puts
        next
    end
}
