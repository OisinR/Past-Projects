using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public float maxSpeed = 5;
    public float speed = 50f;
    public float jumpPower = 500f;
    public float lungePower = 0.2f;


    private Vector2 lungeSpeed = new Vector2(6000, 0);
    private bool canlunge = true;
    private float lungeCooldown = 2f;



    Vector3 tempPos;

    public bool canLunge;
    public bool grounded;

    private Rigidbody2D rb2d;
    private Animator anim;

	void Start () {

        rb2d = gameObject.GetComponent<Rigidbody2D>();
        anim = gameObject.GetComponent<Animator>();

    }


    IEnumerator LungeRight(float lungeDur) 
        {
            maxSpeed = 15;
            float time; 
            time = Time.deltaTime;
            canlunge = false; 
            rb2d.velocity = lungeSpeed; 

        while (lungeDur > time)
            {
                time += Time.deltaTime; 
                yield return 0; 
            }
          
            canlunge = true; 
            maxSpeed = 3;
        }

    IEnumerator LungeLeft(float lungeDur) 
    {
        maxSpeed = 15;
        float time; 
        time = Time.deltaTime;
        canlunge = false;
        rb2d.velocity = -lungeSpeed;

        while (lungeDur > time) 
        {
            time += Time.deltaTime; 
            yield return 0; 
        }
        
        canlunge = true; 
        maxSpeed = 3;
    }



    private void Update()
    {
        anim.SetBool("Grounded", grounded);
        anim.SetFloat("Speed", Mathf.Abs(rb2d.velocity.x));

        if (Input.GetAxis("Horizontal") < -0.1f)
        {
            transform.localScale = new Vector3(-1, 1, 1);
        }

        if (Input.GetAxis("Horizontal") > 0.1f)
        {
            transform.localScale = new Vector3(1, 1, 1);
        }

        if(grounded)
        {
            canLunge = true;
        }


        //To be moved to a better loaction
        if (Input.GetKey("escape"))
            Application.Quit();




        if (Input.GetButtonDown("Jump"))
        {
            if(grounded)
            {
                rb2d.AddForce(Vector2.up * jumpPower);
                

            }
            else
            {
                if(canLunge)
                {
                    canLunge = false;
                    if (Input.GetAxis("Horizontal") > 0.1f)
                    {
                        StartCoroutine(LungeRight(0.3f));
                    }

                    if (Input.GetAxis("Horizontal") < -0.1f)
                    {
                        StartCoroutine(LungeLeft(0.3f));
                    }
               

                }
            }
        }







    }







    void FixedUpdate () {

        Vector3 easeVelocity = rb2d.velocity;
        easeVelocity.y = rb2d.velocity.y;
        easeVelocity.z = 0f;
        easeVelocity.x *= 0.75f;

        float h = Input.GetAxis("Horizontal");

        if (grounded)
        {
            rb2d.velocity = easeVelocity;
        }


        rb2d.AddForce((Vector2.right * speed) * h);

        if (rb2d.velocity.x > maxSpeed)
        {
            rb2d.velocity = new Vector2(maxSpeed, rb2d.velocity.y);
        }

        if (rb2d.velocity.x < -maxSpeed)
        {
            rb2d.velocity = new Vector2(-maxSpeed, rb2d.velocity.y);
        }


        if (transform.position.x > 8.5f)
        {
            transform.position = new Vector2(-8.5f, transform.position.y);
        }

        if (transform.position.x < -8.5f)
        {
            transform.position = new Vector2(8.5f, transform.position.y);
        }

    }
}
