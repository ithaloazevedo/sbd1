#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

struct Carro
{
    string cpfDono;
    string modelo;
    string marca;
    string cor;
    int ano;
    string placa;
    string renavam;
    string combustivel;
};

struct Proprietario
{
    string nome;
    string cpf;
};

int telaInicial()
{
    int aux;
    cout << endl << "====================================" << endl;
    cout << "SISTEMA DE BANCO DE CARROS" << endl;
    cout << endl << "Insira o número da opção desejada:" << endl;
    cout << "1. Cadastrar proprietário" << endl;
    cout << "2. Cadastrar carro" << endl;
    cout << "3. Listar carros de uma pessoa" << endl;
    cout << "4. Sair" << endl;
    cout << "====================================" << endl;

    cin >> aux;
    return aux;
}

int main()
{
    int aux;
    vector<Carro> carros;
    vector<Proprietario> donos;
    Carro automovel;
    Proprietario dono;
    string cpf;
    while (aux!=4)
    {
        aux = telaInicial();
        switch (aux)
        {
            case 1 :
                cout << "Insira o nome do proprietário: " << endl;
                cin >> dono.nome;
                cout << "Insira o cpf do proprietário: " << endl;
                cin >> dono.cpf;
                donos.push_back(dono);
                break;
            case 2:
                cout << "Insira o cpf do proprietário do carro: " << endl;
                cin >> automovel.cpfDono;
                cout << "Insira o modelo do carro: " << endl;
                cin >> automovel.modelo;
                cout << "Insira o ano do carro: " << endl;
                cin >> automovel.ano;
                cout << "Insira o renavam do carro: " << endl;
                cin >> automovel.renavam;
                cout << "Insira o tipo de combustível do carro: " << endl;
                cin >> automovel.combustivel;
                cout << "Insira a cor do carro: " << endl;
                cin >> automovel.cor;
                cout << "Insira a placa do carro: " << endl;
                cin >> automovel.placa;
                carros.push_back(automovel);
                break;
            case 3 :
                cout << "Insira o cpf da pessoa: " << endl;
                cin >> cpf;
                for (int i = 0; i < donos.size(); i++)
                {
                    if(donos[i].cpf == cpf)
                    {
                        cout << "Nome do proprietario: " << donos[i].nome << endl;
                    }
                }
                for (int j = 0; j < carros.size(); j++)
                {
                    if(carros[j].cpfDono == cpf)
                    {
                        cout << "Placa: " << carros[j].placa << endl;
                        cout << "Modelo: " << carros[j].modelo << endl;
                        cout << "Cor: " << carros[j].cor << endl;
                        cout << "Tipo de combustivel: " << carros[j].combustivel << endl;
                        cout << "Ano do carro: " << carros[j].ano << endl;
                        cout << "Renavam: " << carros[j].renavam << endl << endl;
                    }
                }
                break;
            case 4:
                ofstream f_out;
                f_out.open("dados.txt");

                if(! f_out.good())
                    return -1;
                else cout << endl << "O sistema foi encerrado com sucesso!" << endl;

                for (int i = 0; i < donos.size(); i++)
                {
                    f_out << "Nome do proprietario: " << donos[i].nome << endl;
                    cpf = donos[i].cpf;
                    for (int j = 0; j < carros.size(); j++)
                    {
                        if(carros[j].cpfDono == cpf)
                        {
                            f_out << "Placa: " << carros[j].placa << endl;
                            f_out << "Modelo: " << carros[j].modelo << endl;
                            f_out << "Cor: " << carros[j].cor << endl;
                            f_out << "Tipo de combustivel: " << carros[j].combustivel << endl;
                            f_out << "Ano do carro: " << carros[j].ano << endl;
                            f_out << "Renavam: " << carros[j].renavam << endl << endl;
                        }
                    }
                }

                f_out.close();

    return 0;
        }
    }
    return 0;
}