using System;

namespace Lab_Exam5
{
    class Program
    {


        static void Main(string[] args)
        {
            bool playing = false, enemyVisable = false, enemyAudible = false, enemyClose = false, enemyFlanking = false;

            Console.WriteLine("Hey you! What's your name?");
            string playerName = Console.ReadLine();
            while (string.IsNullOrEmpty(playerName))
            {
                Console.WriteLine("Come on now don't be shy.....");
                playerName = Console.ReadLine();
            }

            Console.WriteLine("So your name is {0}? Thats harsh dude. \n", playerName);

            Console.WriteLine("So anyway, want to play a game?");

            playing = readInput();

            if (playing)
            {
                Console.WriteLine("Can you see an enemy?");
                enemyVisable = readInput();


                if (enemyVisable)
                {
                    Console.WriteLine("Is the enemy more than 10m away?");
                    enemyClose = readInput();

                    if (enemyClose)
                    {
                        shoot();
                        gameOver();
                        return;
                    }
                    else
                    {
                        Console.WriteLine("Is the enemy on flank?");
                        enemyFlanking = readInput();
                    }

                    if (enemyFlanking)
                    {
                        move();
                        gameOver();
                        return;
                    }
                    else
                    {
                        attack();
                        gameOver();
                        return;
                    }
                }
                else
                {
                    Console.WriteLine("Can you hear an enemy?");
                    enemyAudible = readInput();
                }
                if (enemyAudible)
                {
                    creep();
                    gameOver();
                    return;
                }

            }
            gameOver();
        }

        public static bool readInput()
        {
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
                return false;
            }
            else
            {
                return true;
            }
        }



        //For Question 5, I still have no idea what I need to do.
        public static void gameOver()
        {
            Console.WriteLine("\nOh, game over then I guess. Press Return to quit.");
            Console.ReadLine();
        }

        public static void creep()
        {
            Console.WriteLine("You creep past the enemy");

        }
        public static void attack()
        {
            Console.WriteLine("You get up close and attack the enemy!");

        }

        public static void move()
        {
            Console.WriteLine("You move and get out of there!");

        }

        public static void shoot()
        {
            Console.WriteLine("You shoot the enemy!");

        }
    }
}
