using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class EnemySquash : MonoBehaviour
{
    public LayerMask enemyLayer;
    public float colRadius, colDistance;




    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (enemyLayer != (1 << collision.gameObject.layer))
        {
            return;
        }
        else
        {
            if (Physics2D.CircleCast(transform.position, colRadius, Vector2.down, colDistance, enemyLayer))
            {
                Destroy(collision.gameObject);
            }
            else
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().name);
            }
        }
    }

}
