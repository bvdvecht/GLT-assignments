module BaseGrammar

layout Whitespace = [\ \t\n\r]+;
lexical Name = [a-zA-Z]+ \ Keywords;
lexical Integer = [0-9]+;
lexical StringExpression = "\"" (![\"])* "\"";
lexical Comment = "#" (![#])* "\n";

keyword Keywords = "Script" | "runs" | "as" | "end" | 
	"step" | "turnLeft" | "drop" | "pick" | "trace" |
	"full" | "mark" | "wall" | "ahead" | "heading" |
	"north" | "south" | "east" | "west" |
	"if" | "do" | "else" | "while" | "repeat" | "times";


syntax Command = "step" | "turnLeft" | "drop" | "pick" | ("trace" StringExpression);

syntax Direction = "north" | "south" | "east" | "west";
syntax Expression = "full" | "mark" | ("wall" "ahead") | ("heading" Direction);

syntax IfStatement = "if" Expression "do" Statement+ 
	("end" | ("else" "do" Statement+ "end"));

syntax WhileStatement = "while" Expression "do" Statement+ "end";

syntax RepeatStatement = "repeat" Integer "times" Statement+ "end";

syntax Statement = Command | IfStatement | WhileStatement | RepeatStatement | Comment;

syntax Program = "Script" Name "runs" "as"
Statement*
"end"
;