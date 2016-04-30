import java.util.Scanner;

public class Spam
{
	public static void main(String[] args)
	{
		int space = 0;
		int lower = 0;
		int upper = 0;
		int symbols = 0;

		String in = new Scanner(System.in).nextLine();
		char[] chars = in.toCharArray();
		double length = chars.length;

		for (char c : chars) {
			int code = (int) c;
			if (c == '_')
				space++;
			else if (code >= 65 && code <= 90)
				upper++;
			else if (code >= 97 && code <= 122)
				lower++;
			else
				symbols++;
		}

		System.out.println(space / length);
		System.out.println(lower / length);
		System.out.println(upper / length);
		System.out.println(symbols / length);
	}
}
