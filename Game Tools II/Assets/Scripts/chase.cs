using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;
using System.Collections;

public class chase : MonoBehaviour {

	public Transform player;
	public Transform head;
	Animator anim;

    public float healthbar = 100;

	string state = "patrol";
	public GameObject[] waypoints;
	int currentWP = 0;
	public float rotSpeed = 200.8f;
	public float speed = .5f;
	float accuracyWP = 5.0f;
    bool inVeiw = false;
    private Rigidbody rb;
    private NavMeshAgent agent;


    void Start () 
	{
        agent = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
        rb = GetComponentInChildren<Rigidbody>();
	}
	

	void FixedUpdate () 
	{
        //Debug.Log(Vector3.Distance(player.transform.position, transform.position));
        Debug.Log(state);
        if (healthbar <= 0)
        {
            Destroy(rb);
            
            if(!inVeiw)
            {
                this.transform.Translate(0, 0.1f, Time.deltaTime * speed);
                inVeiw = true;
            }
            return;
        }
		Vector3 direction = player.position - this.transform.position;
		direction.y = 0;
		float angle = Vector3.Angle(direction, head.up);
		
		if(state == "patrdol" && waypoints.Length > 0)
		{
			anim.SetBool("isIdle",false);
			if(Vector3.Distance(waypoints[currentWP].transform.position, transform.position) < accuracyWP)
			{
				
				currentWP = Random.Range(0,waypoints.Length);
			}
			
			direction = waypoints[currentWP].transform.position - transform.position;
			this.transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(direction), rotSpeed * Time.deltaTime);
			this.transform.Translate(0, 0, Time.deltaTime * speed);
		}
		
		if(Vector3.Distance(player.transform.position, transform.position) < 20 && (angle < 30 || state == "Pursuing" || Vector3.Distance(player.position, this.transform.position) < 3))
		{
            anim.SetBool("isIdle", false);
            agent.destination = player.transform.position;
            state = "Pursuing";
            if (Vector3.Distance(player.transform.position, transform.position) < 2 )
			{
                //Debug.Log("attacking");
                agent.isStopped = true;
                anim.SetTrigger("Attack");
                anim.SetBool("isIdle", true);

            }
            else
            {
                //Debug.Log("walking");
                agent.isStopped = false;
                anim.SetBool("isIdle", false);
            }

        }
		else 
		{
            anim.SetBool("isIdle", true);
			state = "patrol";
		}

	}
}
