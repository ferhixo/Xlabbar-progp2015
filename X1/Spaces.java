import java.util.*;
import java.util.stream.Collectors;

public class Spaces
{
	public static void main(String[] args)
	{
		// Plocka ut de två raderna med input
		Scanner s = new Scanner(System.in);
		String boundaries = s.nextLine();
		String partitions = s.nextLine();

		Scanner s1 = new Scanner(boundaries);
		Scanner s2 = new Scanner(partitions);

		List<Integer> parts = new ArrayList<>();
		Set<Integer> diffs = new HashSet<>();
		List<Integer> res = new ArrayList<>();

		int boundary = s1.nextInt();

		while (s2.hasNext())
			parts.add(s2.nextInt());

		parts.add(0);
		parts.add(boundary);

		for (int x : parts)
			for (int y : parts)
				diffs.add(Math.abs(x - y));

		res.addAll(diffs);
		res.sort((x, y) -> x - y);
		res.remove(0);

		StringBuilder sb = new StringBuilder();
		Iterator<Integer> it = res.iterator();
		while(it.hasNext())
		{
			sb.append(it.next());
			if(it.hasNext()) sb.append(" ");
		}

		System.out.println(sb);
	}
}
