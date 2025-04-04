
{{- define "go-echod843ac96-741b-4e29-98fc-df671eb95c48.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod843ac96-741b-4e29-98fc-df671eb95c48.fullname" -}}
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


{{- define "go-echod843ac96-741b-4e29-98fc-df671eb95c48.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod843ac96-741b-4e29-98fc-df671eb95c48.labels" -}}
helm.sh/chart: {{ include "go-echod843ac96-741b-4e29-98fc-df671eb95c48.chart" . }}
{{ include "go-echod843ac96-741b-4e29-98fc-df671eb95c48.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod843ac96-741b-4e29-98fc-df671eb95c48.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod843ac96-741b-4e29-98fc-df671eb95c48.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}