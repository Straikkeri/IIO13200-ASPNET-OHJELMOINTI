using System;

/// <summary>
/// BLPerson sisältää businessluokat Json demoa varten
/// </summary>
///
namespace JAMK.IT { 
public class Person
{
   public string Name { get; set; }
   public string Gender { get; set; }
   public string Birthday { get; set; }
}
    public class Politic: Person
    {
        public string Party { get; set; }
        public string Position { get; set; }
    }
}