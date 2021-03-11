#!/Users/chelsearoston/.rbenv/versions/3.0.0/bin/ruby

@notes = File.new("qnotes.txt", "a")
date = Time.now.strftime("%d of %B, %Y")

if ARGV[0] == "new"
  input = ARGV.drop(1)
  @notes << "#{date}: #{input.join(" ")}\n"
  @notes.close
elsif ARGV[0] == "show"
  File.foreach("qnotes.txt").each do |line|
    puts "#{$.}: #{line}"
  end
elsif ARGV[0] == "delete"
  File.open("output.txt", "w") do |file_to_write|
    File.open("qnotes.txt").each do |line|
      if $. == ARGV[1]
        file_to_write.write(line.chomp)
      end
    end
  end
end

#   open("qnotes.txt", "r") do |f|
#     open("qnotes.txt.tmp", "w") do |f2|
#       f.each_line do |line|
#         f2.write(line) unless
#       end
#     end
#   end
#   FileUtils.mv 'qnotes.txt.tmp', 'qnotes.txt'
# end
