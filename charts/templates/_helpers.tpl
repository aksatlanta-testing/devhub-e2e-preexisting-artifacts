
{{- define "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.fullname" -}}
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


{{- define "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.labels" -}}
helm.sh/chart: {{ include "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.chart" . }}
{{ include "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8fe5846-8954-4ec2-b87f-c72724ddaa16.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}