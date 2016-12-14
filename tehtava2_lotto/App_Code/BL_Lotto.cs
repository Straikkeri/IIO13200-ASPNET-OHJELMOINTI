using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BL_Lotto
/// </summary>
/// 
namespace JAMK.IT.IIO1320
{

    public class BL_Lotto
    {

        private List<int> rivi = new List<int>();
        Random rand = new Random();
        public int lottoTyyppi;

        public BL_Lotto()
        {
            //konstruktori
        }

        public List<int> arvoJaTulostaRivi()
        {
            try
            {
                if (lottoTyyppi == 1)
                {
                    for (int i = 0; i < 6; i++)
                    {
                        rivi.Add(rand.Next(1, 48));
                    }
                }
                else
                {
                    for (int i = 0; i < 7; i++)
                    {
                        rivi.Add(rand.Next(1, 40));
                    }
                }

                return rivi;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}