using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    public float maxSpeed = 10, jumpForce = 10, checkDistance;
    private Rigidbody2D rb2d;
    public LayerMask groundLayers;
    public bool grounded;
    private bool isFacingLeft;
    public Animator Anim;
    private SpriteRenderer sprRen;

	void Start ()
    {
        rb2d = GetComponent<Rigidbody2D>();
        Anim = GetComponent<Animator>();
        sprRen = GetComponent<SpriteRenderer>();
	}



    void Update()
    {
        grounded = Physics2D.Raycast(transform.position, Vector2.down, checkDistance, groundLayers);
        Anim.SetBool("Grounded", grounded);

        float move = Input.GetAxis("Horizontal");

        rb2d.velocity = new Vector2(move * maxSpeed, rb2d.velocity.y);
        Anim.SetFloat("Speed", Mathf.Abs(move));
        Anim.SetFloat("vSpeed", rb2d.velocity.y);

        if (Input.GetButtonDown("Jump") && grounded)
        {
           rb2d.AddForce(new Vector2(rb2d.velocity.x,jumpForce));
           Anim.SetBool("Grounded", false);
        }
        if((!isFacingLeft && rb2d.velocity.x < 0) | (isFacingLeft && rb2d.velocity.x > 0))
        {
            flip();
        }

	}

    void flip()
    {
        Vector3 scale = transform.localScale;
        scale.x *= -1;
        transform.localScale = scale;
        isFacingLeft = !isFacingLeft;
    }
}
