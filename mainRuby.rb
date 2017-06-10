require 'MethodCall';
require 'ripper'
require 'treetop'
require 'ripper-plus'
require 'axiom_of_choice'
require 'stream'
require 'object_regex'
require 'trollop'
require 'Sexp'
puts "Hi"
files = ["/home/shantanu/RubyCodes/classRuby.rb","/home/shantanu/RubyCodes/ParserAttempt1.rb"];
def read_file(file)
      case file
      when '(stdin)' then $stdin.read
      else File.read(file)
      end
end
parse_forest = files.zip(files.map { |file| Ripper.sexp(read_file(file))})
tree = Sexp.new(parse_forest, "hi", "/home/shantanu/RubyCodes/classRuby.rb");
#while(tree.dfs_enumerator.)
def dfs(node)
  if(node == nil)
    return
  end
  @var = MethodCall.new(node)
  puts "#{node} method-name: #{@var.method_name}";
  children = node.children();
  children.each do |child|
    if(child.is_a? Sexp)
      dfs(child);
    end
  end
end
#puts tree.dfs_enumerator.next()
#@var = MethodCall.new(tree)
#puts "Type:"
#puts @var.method_name;
#puts "Done"
dfs(tree)