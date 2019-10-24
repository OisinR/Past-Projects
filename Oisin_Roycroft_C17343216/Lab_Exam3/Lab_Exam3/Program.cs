using System;

namespace Lab_Exam3
{
    class Program
    {
        

        static void Main(string[] args)
        {
            bool playing, enemyVisable, enemyAudible, enemyClose, enemyFlanking;

            Console.WriteLine("Hey you! What's your name?");
            string playerName = Console.ReadLine();
            while (string.IsNullOrEmpty(playerName))
            {
                Console.WriteLine("Come on now don't be shy.....");
                playerName = Console.ReadLine();
            }

            Console.WriteLine("So your name is {0}? Thats harsh dude. \n", playerName);

            Console.WriteLine("So anyway, want to play a game?");

            string choice = Console.ReadLine();
            if (string.IsNullOrEmpty(choice))
            {
                Console.WriteLine("I need an answer....");
                choice = Console.ReadLine();
            }
            bool choosing = true;
            while (choosing)
            {
                if (!string.Equals(choice, "yes") && !string.Equals(choice, "Yes") && !string.Equals(choice, "no") && !string.Equals(choice, "No"))
                {
                    Console.WriteLine("I don't understand. Yes or No answers only please.");
                    choice = Console.ReadLine();
                }
                else
                {
                    choosing = false;
                }
            }
            if (string.Equals(choice, "no") | string.Equals(choice, "No"))
            {
                Console.WriteLine("Oh, game over then I guess. Press Return to quit.");
                playing = false;
                Console.ReadLine();
                return;
            }
            else
            {
                Console.WriteLine("Play!");
                playing = true;
            }

        }
    }
}
