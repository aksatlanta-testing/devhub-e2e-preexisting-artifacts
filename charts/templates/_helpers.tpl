
{{- define "go-echof9e39119-3b76-4cbe-88f3-05c690233940.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9e39119-3b76-4cbe-88f3-05c690233940.fullname" -}}
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


{{- define "go-echof9e39119-3b76-4cbe-88f3-05c690233940.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9e39119-3b76-4cbe-88f3-05c690233940.labels" -}}
helm.sh/chart: {{ include "go-echof9e39119-3b76-4cbe-88f3-05c690233940.chart" . }}
{{ include "go-echof9e39119-3b76-4cbe-88f3-05c690233940.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9e39119-3b76-4cbe-88f3-05c690233940.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9e39119-3b76-4cbe-88f3-05c690233940.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}