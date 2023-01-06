using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class CirclePenguin : MonoBehaviour
{
    //Used for distance to player for text that pops up
    public GameObject Player;
    public float Distance;
    public GameObject CommandKey;
    public GameObject Command;
    public GameObject Jeff;
    public GameObject Bezos;
    private bool BezosTime = false;

    //Used to trigger animations for the pengiun
    private Animator Animator;

    // Start is called before the first frame update
    void Start()
    {
        Animator = gameObject.GetComponent<Animator>();
        Animator.SetInteger("Walk", 1);
    }

    // In this section, the direction should slowly rotate and move the penguin forward
    void FixedUpdate()
    {
        if(BezosTime){
            //Kicks the penguin
            gameObject.transform.position += Player.transform.forward;
            gameObject.transform.position += gameObject.transform.up;
            StartCoroutine("Kick");

        }   
        else{
            //Rotate a little bit
            gameObject.transform.Rotate(new Vector3(gameObject.transform.rotation.x, gameObject.transform.rotation.y + 5, gameObject.transform.rotation.z), Space.World);
            
            //Move a little each update given the random direction
            gameObject.transform.position += gameObject.transform.forward / 15;
        }
    }

    IEnumerator Kick(){
        yield return new WaitForSeconds(5);
        Destroy(gameObject);
    }

    void Update(){
        //Calculating distance between penguin and player
        var xDiff = gameObject.transform.position.x - Player.transform.position.x;
        var zDiff = gameObject.transform.position.z - Player.transform.position.z;
        Distance = Mathf.Pow(Mathf.Pow(xDiff, 2) + Mathf.Pow(zDiff, 2), (float) 0.5);
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
            }
            else if(Input.GetButtonDown("JeffBezos")){
                CommandKey.SetActive(false);
                Command.SetActive(false);
                Jeff.SetActive(false);
                Bezos.SetActive(false);
                Player.SendMessage("KilledPenguin", SendMessageOptions.DontRequireReceiver);
                BezosTime = true;
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
