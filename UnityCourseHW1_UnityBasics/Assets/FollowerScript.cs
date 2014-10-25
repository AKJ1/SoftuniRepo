using UnityEngine;
using System.Collections;

public class FollowerScript : MonoBehaviour {

	// Use this for initialization
    public GameObject target;
    public float speed;
    public bool isActive;
	void Start () {
	
	}
	
	// Update is called once per frame
	void FixedUpdate () {
	    Follow();
	}

    void Follow()
    {
        checkIfMoves();
        if (Vector3.Distance(transform.position, target.transform.position) > 1 && isActive)
        {
            transform.LookAt(target.transform);
            transform.rigidbody2D.velocity = transform.forward * speed * Vector3.Distance(transform.position, target.transform.position);
        }

    }

    void OnCollisionEnter2D(Collision2D c)
    {
        this.isActive = false;   
    }
    void checkIfMoves()
    {
        float axes = Input.GetAxis("Horizontal") + Input.GetAxis("Vertical");
        if (Mathf.Abs(axes) > 0.05)
        {
            isActive = true;
        }
    }
}
