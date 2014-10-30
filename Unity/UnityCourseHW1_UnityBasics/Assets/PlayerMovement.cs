using UnityEngine;
using System.Collections;

public class PlayerMovement : MonoBehaviour {

	// Use this for initialization
    public float Speed = 5.0f;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update ()
	{
	    Move();
	}

    void Move()
    {
        float deltaX = Input.GetAxis("Horizontal");
        float deltaY = Input.GetAxis("Vertical");

        this.transform.rigidbody2D.velocity = new Vector2(deltaX, deltaY) * Speed;
    }
}
