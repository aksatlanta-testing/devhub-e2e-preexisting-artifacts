
{{- define "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.fullname" -}}
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


{{- define "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.labels" -}}
helm.sh/chart: {{ include "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.chart" . }}
{{ include "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7b288e03-e547-4bae-b7ab-e8c6c72134bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}