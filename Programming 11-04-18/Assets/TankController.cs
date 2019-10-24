using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//TankCotroller is a subclass of MonoBehaviour
public class TankController : MonoBehaviour
{
    //Makes it a slider in the unity editor
    [Range(1, 10)]
    public float movespeed = 5.0f;

    [Range(1, 360)]
    public float rotspeed = 30.0f;


    public GameObject cubePrefab;
    //Awake gets called before start
    public void Awake()
    {
        
    }
	
	void Update ()
    {
        float walk = Input.GetAxis("Vertical");
        float strafe = Input.GetAxis("Horizontal");
        transform.Translate(strafe * movespeed * Time.deltaTime, 0, walk * movespeed * Time.deltaTime);

        float rot = Input.GetAxis("Rotation");
        transform.Rotate(0, rotspeed * rot * Time.deltaTime, 0);

        if (Input.GetKeyDown(KeyCode.Mouse0))
        {
            CreateWall();

        }
       

	}

    void CreateWall()
    {

        for (float x = -5; x <= 4; x ++)
        {
            GameObject cube = GameObject.Instantiate<GameObject>(cubePrefab);
            cube.transform.position = new Vector3(x, 0.5f, 10);
            cube.GetComponent<Renderer>().material.color = Color.HSVToRGB(Random.Range(0, 1f), 1f, 1f);
        }
    }
}
