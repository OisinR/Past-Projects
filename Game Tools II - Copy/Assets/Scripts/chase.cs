﻿using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;
using System.Collections;

public class chase : MonoBehaviour {

	public Transform player;
	public Transform head;
	Animator anim;
	string state = "patrol";
	public GameObject[] waypoints;
	int currentWP = 0;
	public float rotSpeed = 200.8f;
	public float speed = .5f;
	float accuracyWP = 5.0f;
    bool inVeiw = false;
    private Rigidbody rb;
    private NavMeshAgent agent;
    public Collider hitBox;
    public enemyAttack attackScript;

    public AudioClip m_audioClip;
    public AudioClip m_audioClip2;
    private AudioSource m_audioSource;
    void Start () 
	{

        agent = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
        rb = GetComponentInChildren<Rigidbody>();
        m_audioSource = GetComponent<AudioSource>();
    }
	

	void FixedUpdate () 
	{
		Vector3 direction = player.position - this.transform.position;
		direction.y = 0;
		float angle = Vector3.Angle(direction, head.up);
		
		if(state == "patrol" && waypoints.Length > 0)
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

            /*
            m_audioSource.panStereo = 1f;
            m_audioSource.pitch = 1f;
            m_audioSource.PlayOneShot(m_audioClip2);
            */
            if (Vector3.Distance(player.transform.position, transform.position) < 2 )
			{
                agent.isStopped = true;
                anim.SetTrigger("Attack");
                m_audioSource.panStereo = 1f;
                m_audioSource.pitch = 1f;
                m_audioSource.PlayOneShot(m_audioClip);
                anim.SetBool("isIdle", true);

            }
            else
            {
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
