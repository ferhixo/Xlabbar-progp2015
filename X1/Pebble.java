import java.util.*;
import java.util.stream.Stream;

import static java.util.Arrays.asList;

class Tree {
	private String value;
	private List<Tree> children = new LinkedList<>();

	public Tree(String value, List<Tree> children) {
		super();
		this.value = value;
		this.children.addAll(children);
	}

	public Tree(String value, Tree... children) {
		this(value, asList(children));
	}

	public String getValue() {
		return value;
	}

	public List<Tree> getChildren() {
		return Collections.unmodifiableList(children);
	}

	public void setChildren(List<Tree> children)
	{
		this.children = children;
	}

	public Stream<Tree> flattened() {
		return Stream.concat(
				Stream.of(this),
				children.stream().flatMap(Tree::flattened));
	}
}

public class Pebble
{
	static int[] res;
	static Tree tree;

	public static void main(String[] args)
	{
		Scanner s = new Scanner(System.in);
		int lines = s.nextInt();
		s.nextLine(); // Discard newline after int

		// Create result array and run games
		res = new int[lines];
		for (int i = 0; i < lines; i++) res[i] = runGame(s.nextLine());
		for (int r : res) System.out.println(r);
	}

	public static int runGame(String input)
	{
		tree = runAlg(input);
		runRecursively(tree);

		return tree.flattened()
				.map(Tree::getValue)
				.map(x -> x.replace("-", "").length())
				.min(Integer::compareTo)
				.get();
	}

	public static void runRecursively(Tree input)
	{
		for (Tree child : input.getChildren())
		{
			Tree newChild = runAlg(child.getValue());
			child.setChildren(newChild.getChildren());

			if (!newChild.getChildren().isEmpty())
				runRecursively(newChild);
		}
	}

	public static Tree runAlg(String input)
	{
		List<Tree> children = new ArrayList<>();

		// -oo => o--
		// oo- => --o
		for (int i = 0; i < 10; i++)
		{
			String part = input.substring(i, i + 3);

			if (part.equals("oo-"))
				children.add(new Tree(input.substring(0, i) + "--o" + input.substring(i + 3)));

			if (part.equals("-oo"))
				children.add(new Tree(input.substring(0, i) + "o--" + input.substring(i + 3)));
		}

		return new Tree(input, children);
	}

}
