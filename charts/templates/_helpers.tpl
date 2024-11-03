
{{- define "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.labels" -}}
helm.sh/chart: {{ include "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.chart" . }}
{{ include "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo90ba88e5-3ad1-4fad-bdf1-f858e942fdef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}