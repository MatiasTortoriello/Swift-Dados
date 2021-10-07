import UIKit

class DestinationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var diceView1: UIImageView!
    @IBOutlet weak var diceView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTable: UITableView!
    @IBOutlet weak var pairText: UILabel!
    //String Resultados (vacío)
    var results: [Int] = []
    //String imágenes dados
    let diceImages: [String] = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTable.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "Results")
        
        let nib = UINib(nibName: "ResultTableViewCell", bundle: Bundle.main)
        resultTable.register(nib, forCellReuseIdentifier: "ResultTableViewCell")
        
        resultTable.delegate = self
        resultTable.dataSource = self
        
    }
    
    //FUNCIÓN UPDATE
    
    func updateResultsTable(){
            var resultsText = ""
        for sum in results{
            resultsText += "Total: \(sum)"
        }
        resultTable.reloadData()
    }
    
    
    //Función de presionado del botón
    @IBAction func rollButtonPressed(){
        //Evento
        let dice1: Int =  Int(arc4random()) % 6
        let dice2: Int =  Int(arc4random()) % 6
        
        let sum : Int = ((dice1+dice2)+1)
        
        print(dice1)
        print(dice2)

        diceView1.image = UIImage(named: diceImages[dice1])
        diceView2.image = UIImage(named: diceImages[dice2])
        
        //En results[] va a entrar la suma de ambos dados
        results.append(sum)
        
        resultLabel.text = "The numbers are \(dice1+1) and \(dice2+1). Total is \(sum+1) "
        //pairAnnouncment(dice1, dice2)
        if (dice1 == dice2){
            pairText.text = "PAIR!"
        } else {
            pairText.text = ""
        }
        updateResultsTable()
    }
    
    //func pairAnnouncment(Int, Int) => String {
    
    
//FUNCIONES DELEGATE Y SOURCE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = results[indexPath.row]
        
        let cell = resultTable.dequeueReusableCell(withIdentifier: "Results") as! ResultTableViewCell
     
        cell.resultDices.text = "Launch number \(indexPath.row + 1) - Score = \(result + 1)"
        
        return cell
    }
    
    @IBAction func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
