String vowels = "aeiou";
public void setup()
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord) //!! Completed by Tully !!
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  if(sWord.length() > 0)
  {
    for(int i = 0; i < sWord.length(); i ++)
    {
      for(int j = 0; j < vowels.length(); j ++)
      {
        if(sWord.charAt(i) == vowels.charAt(j))
        {
          return i;
        }
      }
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
    return sWord + " becomes: " + sWord + "ay";
  }
  else if(sWord.length() > 0)
  {
    if(findFirstVowel(sWord.substring(0, 1)) != -1) 
    {
      return sWord + " becomes: " + sWord + "way";
    }
    else if(sWord.substring(0, 2).equals("qu"))
    {
      return sWord + " becomes: " + sWord.substring(2, sWord.length()) + "quay";
    }
    return sWord + " becomes: " + sWord.substring(findFirstVowel(sWord), sWord.length()) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  }
  else
  {
    return "ERROR!";
  }
}
