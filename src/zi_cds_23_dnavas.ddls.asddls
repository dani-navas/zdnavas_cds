@AccessControl.authorizationCheck: #NOT_ALLOWED
define hierarchy ZI_CDS_23_DNAVAS
  as parent child hierarchy(
    source ZI_cDS_22_DNAVAS
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      Empleado
    multiple parents allowed
    orphans ignore
    cycles breakup cache on

  )
{
  key Empleado                    as Empleado,
      Manager                     as Manager,
      Nombre_Empleado             as Nombre_Empleado,
      $node.parent_id             as ParentID,
      $node.node_id               as NodeID,
      $node.hierarchy_tree_size   as HTREESIZE,
      $node.hierarchy_rank        as HRANK,
      $node.hierarchy_parent_rank as HPARENTRANK,
      $node.hierarchy_level       as HLEVEL,
      $node.hierarchy_is_orphan   as HOPRHAN,
      $node.hierarchy_is_cycle    as HCYCLE

}
