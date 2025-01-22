
{{- define "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.fullname" -}}
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


{{- define "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.labels" -}}
helm.sh/chart: {{ include "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.chart" . }}
{{ include "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfe42e3c-e399-4c18-9d75-52b43c11da70.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}