function binddir
{
  # TODO: Input validation.
  sudo mount --bind $1 $2
}

