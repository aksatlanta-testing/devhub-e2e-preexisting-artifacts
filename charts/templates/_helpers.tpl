
{{- define "go-echod2619e9c-5724-427f-a504-a525e63852af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2619e9c-5724-427f-a504-a525e63852af.fullname" -}}
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


{{- define "go-echod2619e9c-5724-427f-a504-a525e63852af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2619e9c-5724-427f-a504-a525e63852af.labels" -}}
helm.sh/chart: {{ include "go-echod2619e9c-5724-427f-a504-a525e63852af.chart" . }}
{{ include "go-echod2619e9c-5724-427f-a504-a525e63852af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2619e9c-5724-427f-a504-a525e63852af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2619e9c-5724-427f-a504-a525e63852af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}