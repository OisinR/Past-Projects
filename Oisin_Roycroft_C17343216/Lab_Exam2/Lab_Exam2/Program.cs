using System;

namespace Lab_Exam2
{
    class Program
    {
        bool playing, enemyVisable, enemyAudible, enemyClose, enemyFlanking;
        

        static void Main(string[] args)
        {
            Console.WriteLine("Hey you! What's your name?");
            string playerName = Console.ReadLine();
            while(string.IsNullOrEmpty(playerName))
            {
                Console.WriteLine("Come on now don't be shy.....");
                playerName = Console.ReadLine();
            }

            Console.WriteLine("So your name is {0}? Thats harsh dude.", playerName);
        }
    }
}
