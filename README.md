# Customer Retention

Problem Statement:<br>
Can customer and household usage of passes and spend determine if a customer is likely to not purchase a season pass for the following season? If so, what are the reasons they would not renew and how do we mitigate those impacts through enhanced Sales and Marketing activities?


## Getting Started

The original dataset came from a SQL Server data warehouse. There is a PDF of the ERD in the SQL folder. Additionally, there is a document called SQL Overview.doc that walks through all of the views and SQL queries that are located in the SQL folder. It is complicated and there is a lot of logic wrapped up in the SQL.

In the end, I was able to get all of the usage, pass, and spend data on to one line for each customer who has bought a pass between 2010 and 2016. I also limited the data to just customers who live in Colorado. That still comes out to 139,616 records. The final output from the database to the models is called CO_2014_2015.csv

### Notebooks

The notebooks are still a WIP. For now, Customer_Retention_Model_2015 and Pipeline are where the majority of the modeling is taking place. I still need to organize the notebooks and clean up the cells!

### Prerequisites

MS Word<br>
Jupyter Notebook<br>
Tableau Desktop

```
Give examples
```

------------------------

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
