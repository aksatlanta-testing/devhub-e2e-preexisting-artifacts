
{{- define "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.fullname" -}}
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


{{- define "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.labels" -}}
helm.sh/chart: {{ include "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.chart" . }}
{{ include "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6bec14be-51ab-4d61-913b-7aa6b9250dad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}