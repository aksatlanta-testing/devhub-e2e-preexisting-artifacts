
{{- define "go-echo03069a23-4788-4091-a926-04cded33511b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03069a23-4788-4091-a926-04cded33511b.fullname" -}}
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


{{- define "go-echo03069a23-4788-4091-a926-04cded33511b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03069a23-4788-4091-a926-04cded33511b.labels" -}}
helm.sh/chart: {{ include "go-echo03069a23-4788-4091-a926-04cded33511b.chart" . }}
{{ include "go-echo03069a23-4788-4091-a926-04cded33511b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03069a23-4788-4091-a926-04cded33511b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03069a23-4788-4091-a926-04cded33511b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}