<?php

namespace App\Entity;


use ApiPlatform\Metadata\ApiResource;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ApiResource(
    operations: [
        new \ApiPlatform\Metadata\GetCollection(
            uriTemplate: '/voir_gendarmes',
            name: 'get_person_list'
        ),
        new \ApiPlatform\Metadata\Post(
            uriTemplate: '/ajouter_gendarmes',
            name: 'create_person'
        ),
        new \ApiPlatform\Metadata\Get(
            uriTemplate: '/selection_gendarme/{id}',
            name: 'get_person'
        ),
        new \ApiPlatform\Metadata\Delete(
            uriTemplate: '/supprimer_gendarme/{id}',
            name: 'delete_person'
        )
    ]
)]
class Person
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    private ?string $prenom = null;

    #[ORM\Column(length: 255)]
    private ?string $nigend = null;

    #[ORM\Column(length: 255)]
    private ?string $service = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): static
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getNigend(): ?string
    {
        return $this->nigend;
    }

    public function setNigend(string $nigend): static
    {
        $this->nigend = $nigend;

        return $this;
    }

    public function getService(): ?string
    {
        return $this->service;
    }

    public function setService(string $service): static
    {
        $this->service = $service;

        return $this;
    }
}