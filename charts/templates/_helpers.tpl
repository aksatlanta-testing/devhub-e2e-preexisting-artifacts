
{{- define "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.fullname" -}}
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


{{- define "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.labels" -}}
helm.sh/chart: {{ include "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.chart" . }}
{{ include "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5fa0641c-dcc2-4fa4-886c-5a14a817c514.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}