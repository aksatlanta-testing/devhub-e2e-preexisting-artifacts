
{{- define "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.fullname" -}}
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


{{- define "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.labels" -}}
helm.sh/chart: {{ include "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.chart" . }}
{{ include "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo984970d3-04cc-4b26-b2a7-557c13574a05.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}