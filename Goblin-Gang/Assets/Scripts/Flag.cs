using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Flag : MonoBehaviour
{
    
    public GameObject Player;
    public float Distance;
    public GameObject CommandKey;
    public GameObject Command;
    public int Karma;

    // Start is called before the first frame update
    void Start()
    {
     Karma = 0;   
    }

    // Update is called once per frame
    void Update()
    {
        //Calculating distance between penguin and player
        var xDiff = gameObject.transform.position.x - Player.transform.position.x;
        var zDiff = gameObject.transform.position.z - Player.transform.position.z;
        Distance = Mathf.Pow(Mathf.Pow(xDiff, 2) + Mathf.Pow(zDiff, 2), (float) 0.5);
        if(Distance > 5){
            CommandKey.SetActive(false);
            Command.SetActive(false);
        }
        Karma = Player.GetComponent<Player>().Karma;
    }
    void OnMouseOver(){
        //When within 2 units, show door instructions and allow them to teleport
        if(Distance < 5){
            //Showing the texts on canvas and changes the text
            Command.GetComponent<Text>().text = "Finish";
            CommandKey.GetComponent<Text>().text = "[E]";
            CommandKey.SetActive(true);
            Command.SetActive(true);
            if(Input.GetButtonDown("Action") && Karma < 300 ){
                SceneManager.LoadScene("Win");
            }
            else if(Input.GetButtonDown("Action") && Karma < 300 ){
                SceneManager.LoadScene("SpecialWin");
            }
        }
        else{
            CommandKey.SetActive(false);
            Command.SetActive(false);
        }    
    }

    void OnMouseExit(){
        CommandKey.SetActive(false);
        Command.SetActive(false);
    }
}
