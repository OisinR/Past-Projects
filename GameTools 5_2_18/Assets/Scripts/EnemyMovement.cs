using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMovement : MonoBehaviour
{
    public float maxSpeed;
    private Rigidbody2D rb2d;
    public Transform leftpos, rightpos;

    private bool isFacingLeft;
	void Start ()
    {
        rb2d = GetComponent<Rigidbody2D>();
	}
	
	void Update ()
    {
        rb2d.velocity = new Vector2(maxSpeed * transform.localScale.x, rb2d.velocity.y);
        if(!isFacingLeft && transform.position.x > rightpos.position.x)
        {
            flip();
        }
        if (isFacingLeft && transform.position.x < leftpos.position.x)
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
