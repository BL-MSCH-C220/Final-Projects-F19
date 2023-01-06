using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class RandomPenguin : MonoBehaviour
{
    //Used to generate which direction the penguin goes
    System.Random rand = new System.Random();
    Vector3 Direction = new Vector3(0,0,0);

    //How often the penguin should move, counter is used to count up to Cycle
    private int Cycle = 120;
    private int counter;

    //Used for distance to player for text that pops up
    public GameObject Player;
    public float Distance;
    public GameObject CommandKey;
    public GameObject Command;
    public GameObject Jeff;
    public GameObject Bezos;

    //Used to trigger animations for the pengiun
    private Animator Animator;
    private Rigidbody Rigidbody;

    //Stuff for penguin physics
    public float movementSpeed = 3;
    private bool Moving = false;

    //For kicking penguin
    private bool BezosTime = false;
    
   

    // Start is called before the first frame update
    void Start()
    {
        Animator = gameObject.GetComponent<Animator>();
        counter = 0;
        Direction = new Vector3(rand.Next(180), 0, rand.Next(180));
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if(Distance < 15){
            //Making penguin runs away
            gameObject.transform.rotation = Player.transform.rotation;
            gameObject.transform.position += gameObject.transform.forward / 15;
            Animator.SetInteger("Walk", 1);
        }
        else{
            //Walking animation triggered while moving
            if(Moving){
                Animator.SetInteger("Walk", 1);
            }
            else{
                Animator.SetInteger("Walk", 0);
            }
            counter += 1;
            if(counter >= Cycle){
                Moving = true;

                //Face random direction, only do this once per movement
                if(counter == Cycle){
                    gameObject.transform.Rotate(new Vector3(0, rand.Next(0, 360),0), Space.World);
                }
            
                //Move a little each update given the random direction
                gameObject.transform.position += gameObject.transform.forward / 25;

            }
            else{
                Moving = false;
            }

            if(counter == 2 * Cycle){
                counter = 0;
            }
        }
    }

    void Update(){
        //Calculating distance between penguin and player
        var xDiff = gameObject.transform.position.x - Player.transform.position.x;
        var zDiff = gameObject.transform.position.z - Player.transform.position.z;
        Distance = Mathf.Pow(Mathf.Pow(xDiff, 2) + Mathf.Pow(zDiff, 2), (float) 0.5);

        //Kicks penguin, gives player money
        if(BezosTime){
            //Kicks the penguin
            gameObject.transform.position += Player.transform.forward;
            gameObject.transform.position += gameObject.transform.up;
            StartCoroutine("Kick");
        }  
    }

    IEnumerator Kick(){
        yield return new WaitForSeconds(5);
        Destroy(gameObject);
    }


    void OnMouseOver(){
        //When within 2 units, show door instructions and allow them to teleport
        if(Distance < 10){
            //Showing the texts on canvas and changes the text
            CommandKey.SetActive(true);
            Command.SetActive(true);
            Jeff.SetActive(true);
            Bezos.SetActive(true);
            if(Input.GetButtonDown("Action") ){
                Destroy(gameObject);
                CommandKey.SetActive(false);
                Command.SetActive(false);
                Jeff.SetActive(false);
                Bezos.SetActive(false);
                Player.SendMessage("SavedPenguin", SendMessageOptions.DontRequireReceiver);
                //Probably add something here the decreases the meter
            }//Else kicks the penguin and makes you money
            else if(Input.GetButtonDown("JeffBezos")){
                CommandKey.SetActive(false);
                Command.SetActive(false);
                Jeff.SetActive(false);
                Bezos.SetActive(false);
                BezosTime = true;
                Player.SendMessage("KilledPenguin", SendMessageOptions.DontRequireReceiver);
            }
        }
        else{
            CommandKey.SetActive(false);
            Command.SetActive(false);
            Jeff.SetActive(false);
            Bezos.SetActive(false);
        }    
    }

    void OnMouseExit(){
        CommandKey.SetActive(false);
        Command.SetActive(false);
        Jeff.SetActive(false);
        Bezos.SetActive(false);
    }
}
