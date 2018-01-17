public ArrayList <String> wordList = new ArrayList <String>();
public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
	
	String[] hymn = loadStrings("LowellHymn.txt");
	System.out.println();
	System.out.println("The Lowell Hymn");
	for(int i = 0; i < hymn.length; i ++){
		pigLatinLine(hymn,i);
	}
}
public void pigLatinStart(ArrayList <String> sWords){
	if(sWords.size() > 0){
		for(int i = 0; i < sWords.size() - 1; i ++){
			System.out.print(pigLatin(sWords.get(i)) + " ");
		}
		System.out.println(pigLatin(sWords.get(sWords.size()-1)));
		remove(sWords);
	}
	else{
		System.out.println();
	}
}

public void pigLatinLine(String[] line, int i){
	int start;
	int stop = -1;
	for(int j = 0; j < line[i].length() - 1;j++){
		if(line[i].charAt(j) == ' ' || line[i].charAt(j) == ',' || line[i].charAt(j) == '.'){
			start = stop + 1;
			stop = j;
			if(start > line[i].length() - 1){return;}
			String word = line[i].substring(start,stop);
			wordList.add(word);
		}
	}
	pigLatinStart(wordList);
}
public void remove(ArrayList <String> toRemove){
	for(int i = toRemove.size() - 1; i >= 0; i --){
		toRemove.remove(i);
	}
}
public int findFirstVowel(String sWord){
	for(int i = 0; i < sWord.length(); i ++){
		String t = sWord.substring(i, i + 1);
		if(sWord.substring(0,2).equals("qu")){
			return -2;
		}
		if(t.equals("a") || t.equals("e") || t.equals("i") || t.equals("o") || t.equals("u")){
		    return i;
		}
	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0){
		return sWord + "way";
	}
	else if(findFirstVowel(sWord) == -2){
		String end = sWord.substring(2, sWord.length());
		return end + "qu" + "ay";
	}
	else
	{
		String end = sWord.substring(findFirstVowel(sWord), sWord.length());
		String begin = sWord.substring(0,findFirstVowel(sWord));
		return end + begin + "ay";
	}

}
